import { Artwork } from "./artwork";
import { Exhibition } from "./exhibition";

export class User {
  id: number;
  username: string;
  email: string;
  password: string;
  role: string;
  enabled: boolean;
  createdAt: string;
  updatedAt: string;
  favoriteArtworks: Artwork[];
  artwork: Artwork[];
  favoriteExhibitions: Exhibition[];

  constructor(
    id: number = 0,
    username: string = '',
    email: string = '',
    password: string = '',
    role: string = '',
    enabled: boolean = true,
    createdAt: string = '',
    updatedAt: string = '',
    favoriteArtworks: Artwork[] = [],
    artwork: Artwork[] = [],
    favoriteExhibitions: Exhibition[] = []
  ) {
    this.id = id;
    this.username = username;
    this.email = email;
    this.password = password;
    this.role = role;
    this.enabled = enabled;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
    this.favoriteArtworks = favoriteArtworks;
    this.artwork = artwork;
    this.favoriteExhibitions = favoriteExhibitions;
  }

  toString(): string {
    return `User [id=${this.id}, username=${this.username}, email=${this.email}, role=${this.role}]`;
  }

  equals(other: User): boolean {
    return this.id === other.id;
  }

  hashCode(): number {
    return this.id;
  }
}
