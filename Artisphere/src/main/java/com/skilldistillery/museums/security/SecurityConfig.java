package com.skilldistillery.museums.security;

import static org.springframework.security.config.Customizer.withDefaults;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Autowired
    private DataSource dataSource;

    @Autowired
    private PasswordEncoder encoder;
	
    @Bean 
    SecurityFilterChain createFilterChain(HttpSecurity http) throws Exception {
        http.csrf(csrf -> csrf.disable());
        http.httpBasic(withDefaults());
        http.authorizeHttpRequests(
          authorize -> authorize
            .requestMatchers(HttpMethod.OPTIONS, "/api/**").permitAll()
            .requestMatchers(HttpMethod.OPTIONS, "/**").permitAll()
            .requestMatchers(HttpMethod.GET, "/**").permitAll()
            .requestMatchers(HttpMethod.GET, "/api/artworks").permitAll()
            .requestMatchers("/api/**").authenticated()
            .anyRequest().permitAll());

        http.sessionManagement(management -> management
                              .sessionCreationPolicy(SessionCreationPolicy.STATELESS));
        return http.build();
    }
    
    @Autowired
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        String userQuery = "SELECT username, password, enabled FROM user WHERE username=?";
        String authQuery = "SELECT username, role FROM user WHERE username=?";
        auth
        .jdbcAuthentication()
        .dataSource(dataSource)
        .usersByUsernameQuery(userQuery)
        .authoritiesByUsernameQuery(authQuery)
        .passwordEncoder(encoder);
    }
}
