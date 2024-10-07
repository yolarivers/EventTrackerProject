import { Exhibition } from './exhibition';

export class Museum {
  id: number;
  name: string;
  location: string;
  description: string;
  websiteUrl: string;
  imageUrl: string;
  createdAt: string;
  updatedAt: string;
  exhibition: Exhibition[];

  constructor(
    id: number = 0,
    name: string = '',
    location: string = '',
    description: string = '',
    websiteUrl: string = '',
    imageUrl: string = '',
    createdAt: string = '',
    updatedAt: string = '',
    exhibition: Exhibition[] = []
  ) {
    this.id = id;
    this.name = name;
    this.location = location;
    this.description = description;
    this.websiteUrl = websiteUrl;
    this.imageUrl = imageUrl;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
    this.exhibition = exhibition;
  }

  toString(): string {
    return `Museum [id=${this.id}, name=${this.name}, location=${this.location}]`;
  }

  equals(other: Museum): boolean {
    return other instanceof Museum && this.id === other.id;
  }

  hashCode(): number {
    return this.id;
  }
}
