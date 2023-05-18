import { Beat } from 'src/beats/entities/beat.entity';
import { Transaction } from 'src/transactions/entities/transaction.entity';

export class User {
  id: number;

  username: string;

  email: string;

  password: string;

  role: string;

  first_name?: string;

  last_name?: string;

  avatar_url: string;

  created_at: Date;

  updated_at: Date;

  beats?: Beat[];

  transactions?: Transaction[];
}
