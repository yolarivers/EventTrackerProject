import { Museums } from "./museums";
import { User } from "./user";

export class Artwork {
  id: number;
  title: string;
  artist: string;
  user: User | null;
  museums: Museums | null;
  creationYear: number;
  description: string;
  image: string;
  createdAt: string;
  updatedAt: string;

  constructor(
    id: number = 0,
    title: string = '',
    artist: string = '',
    user: User | null = null,
    museums: Museums | null = null,
    creationYear: number = 0,
    description: string = '',
    image: string = '',
    createdAt: string = '',
    updatedAt: string = ''
  ) {
    this.id = id;
    this.title = title;
    this.artist = artist;
    this.user = user;
    this.museums = museums;
    this.creationYear = creationYear;
    this.description = description;
    this.image = image;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }

  toString(): string {
    return `Artwork [id=${this.id}, title=${this.title}, artist=${this.artist}, creationYear=${this.creationYear}]`;
  }

  equals(other: Artwork): boolean {
    return this.id === other.id;
  }

  hashCode(): number {
    return this.id;
  }
}
