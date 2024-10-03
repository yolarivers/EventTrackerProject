import { Exhibitions } from "./exhibitions";
import { User } from "./user";

export class ExhibitionsReview {
  id: number;
  user: User | null;
  exhibitions: Exhibitions | null;
  rating: number;
  comment: string;
  createdAt: string;
  updatedAt: string;

  constructor(
    id: number = 0,
    user: User | null = null,
    exhibitions: Exhibitions | null = null,
    rating: number = 0,
    comment: string = '',
    createdAt: string = '',
    updatedAt: string = ''
  ) {
    this.id = id;
    this.user = user;
    this.exhibitions = exhibitions;
    this.rating = rating;
    this.comment = comment;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }

  toString(): string {
    return `ExhibitionsReview [id=${this.id}, rating=${this.rating}, comment=${this.comment}]`;
  }

  equals(other: ExhibitionsReview): boolean {
    return this.id === other.id;
  }

  hashCode(): number {
    return this.id;
  }
}
