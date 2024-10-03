import { Exhibitions } from "./exhibitions";

export class Museums {
  id: number;
  name: string;
  location: string;
  description: string;
  websiteUrl: string;
  imageUrl: string;
  createdAt: string;
  updatedAt: string;
  exhibitions: Exhibitions[];

  constructor(
    id: number = 0,
    name: string = '',
    location: string = '',
    description: string = '',
    websiteUrl: string = '',
    imageUrl: string = '',
    createdAt: string = '',
    updatedAt: string = '',
    exhibitions: Exhibitions[] = []
  ) {
    this.id = id;
    this.name = name;
    this.location = location;
    this.description = description;
    this.websiteUrl = websiteUrl;
    this.imageUrl = imageUrl;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
    this.exhibitions = exhibitions;
  }

  toString(): string {
    return `Museums [id=${this.id}, name=${this.name}, location=${this.location}]`;
  }

  equals(other: Museums): boolean {
    return this.id === other.id;
  }

  hashCode(): number {
    return this.id;
  }
}
