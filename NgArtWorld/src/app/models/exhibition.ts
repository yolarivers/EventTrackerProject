import { Artwork } from './artwork';
import { Museum } from './museum';

export class Exhibition {
  id?: number;
  title: string;
  museum: Museum;
  description: string;
  startDate: string;
  endDate: string;
  imageUrl?: string;
  createdAt?: string;
  updatedAt?: string;
  artwork: Artwork[];

  constructor(
    title: string = '',
    description: string = '',
    startDate: string = '',
    endDate: string = '',
    museum: Museum = new Museum(),
    artwork: Artwork[] = [],
    id?: number,
    imageUrl?: string,
    createdAt?: string,
    updatedAt?: string
  ) {
    this.id = id;
    this.title = title;
    this.museum = museum;
    this.description = description;
    this.startDate = startDate;
    this.endDate = endDate;
    this.imageUrl = imageUrl;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
    this.artwork = artwork;
  }

  toString(): string {
    return `Exhibition [id=${this.id}, title=${this.title}]`;
  }

  equals(other: Exhibition): boolean {
    return this.id === other.id;
  }

  hashCode(): number {
    return this.id || 0;
  }
}
