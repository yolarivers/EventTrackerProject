import { Artwork } from './artwork';


export class Exhibition {
  id: number;
  title: string;
;
  description: string;
  startDate: string;
  endDate: string;
  imageUrl: string;
  createdAt: string;
  updatedAt: string;
  artwork: Artwork[];

  constructor(
    title: string = '',
    description: string = '',
    startDate: string = '',
    endDate: string = '',
   
    artwork: Artwork[] = [],
    id: number = 0,
    imageUrl: string = "",
    createdAt: string = "",
    updatedAt: string= ""
  ) {
    this.id = id;
    this.title = title;
   
    this.description = description;
    this.startDate = startDate;
    this.endDate = endDate;
    this.imageUrl = imageUrl;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
    this.artwork = artwork;
  }

  
}