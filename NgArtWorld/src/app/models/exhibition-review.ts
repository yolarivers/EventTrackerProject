import { Exhibition } from "./exhibition";
import { User } from "./user";

export class ExhibitionReview {
  id: number;
  user: User | null;
  exhibition: Exhibition | null;
  rating: number;
  comment: string;
  createdAt: string;
  updatedAt: string;

  constructor(
    id: number = 0,
    user: User | null = null,
    exhibition: Exhibition | null = null,
    rating: number = 0,
    comment: string = '',
    createdAt: string = '',
    updatedAt: string = ''
  ) {
    this.id = id;
    this.user = user;
    this.exhibition = exhibition;
    this.rating = rating;
    this.comment = comment;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }

  toString(): string {
    return `ExhibitionReview [id=${this.id}, rating=${this.rating}, comment=${this.comment}]`;
  }

  equals(other: ExhibitionReview): boolean {
    return this.id === other.id;
  }

  hashCode(): number {
    return this.id;
  }
}
