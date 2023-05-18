export class CreateUserDto {
  readonly username: string;
  readonly email: string;
  readonly password: string;
  readonly first_name?: string;
  readonly last_name?: string;
  readonly avatar_url?: string;
}
