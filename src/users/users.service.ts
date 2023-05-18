import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import { User as UserModel } from '@prisma/client';

@Injectable()
export class UsersService {
  constructor(private prismaService: PrismaService) {}

  async create(createUserDto: CreateUserDto): Promise<UserModel> {
    const user = await this.prismaService.user.create({
      data: {
        username: createUserDto.username,
        email: createUserDto.email,
        password: createUserDto.password,
        first_name: createUserDto.first_name,
        last_name: createUserDto.last_name,
        avatar_url: createUserDto.avatar_url,
      },
    });
    return user;
  }

  async findAll(): Promise<UserModel[]> {
    const users = await this.prismaService.user.findMany();
    return users;
  }

  async findOne(id: number): Promise<UserModel> {
    const user = await this.prismaService.user.findUnique({
      where: { id },
    });

    if (!user) {
      throw new NotFoundException(`User #${id} not found`);
    }

    return user;
  }

  async update(id: number, updateUserDto: UpdateUserDto): Promise<UserModel> {
    await this.findOne(id);

    const user = await this.prismaService.user.update({
      where: { id },
      data: {
        username: updateUserDto.username,
        email: updateUserDto.email,
        password: updateUserDto.password,
        first_name: updateUserDto.first_name,
        last_name: updateUserDto.last_name,
        avatar_url: updateUserDto.avatar_url,
      },
    });

    return user;
  }

  async remove(id: number): Promise<void> {
    await this.findOne(id);

    await this.prismaService.user.delete({
      where: { id },
    });
  }
}
