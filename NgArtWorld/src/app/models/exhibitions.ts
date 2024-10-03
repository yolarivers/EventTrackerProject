import { Artwork } from "./artwork";
import { Museums } from "./museums";

export class Exhibitions {
  id: number;
  title: string;
  museums: Museums | null;
  description: string;
  startDate: string;
  endDate: string;
  imageUrl: string;
  createdAt: string;
  updatedAt: string;
  artworks: Artwork[];

  constructor(
    id: number = 0,
    title: string = '',
    museums: Museums | null = null,
    description: string = '',
    startDate: string = '',
    endDate: string = '',
    imageUrl: string = '',
    createdAt: string = '',
    updatedAt: string = '',
    artworks: Artwork[] = []
  ) {
    this.id = id;
    this.title = title;
    this.museums = museums;
    this.description = description;
    this.startDate = startDate;
    this.endDate = endDate;
    this.imageUrl = imageUrl;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
    this.artworks = artworks;
  }

  toString(): string {
    return `Exhibitions [id=${this.id}, title=${this.title}]`;
  }

  equals(other: Exhibitions): boolean {
    return this.id === other.id;
  }

  hashCode(): number {
    return this.id;
  }
}
