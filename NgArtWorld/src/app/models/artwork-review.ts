import { Artwork } from "./artwork";
import { User } from "./user";

export class ArtworkReview {
  id: number;
  user: User | null;
  artwork: Artwork | null;
  rating: number;
  comment: string;
  createdAt: string;
  updatedAt: string;

  constructor(
    id: number = 0,
    user: User | null = null,
    artwork: Artwork | null = null,
    rating: number = 0,
    comment: string = '',
    createdAt: string = '',
    updatedAt: string = ''
  ) {
    this.id = id;
    this.user = user;
    this.artwork = artwork;
    this.rating = rating;
    this.comment = comment;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }

  toString(): string {
    return `ArtworkReview [id=${this.id}, rating=${this.rating}, comment=${this.comment}]`;
  }

  equals(other: ArtworkReview): boolean {
    return this.id === other.id;
  }

  hashCode(): number {
    return this.id;
  }
}
