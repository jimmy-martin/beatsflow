import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateCategoryDto } from './dto/create-category.dto';
import { UpdateCategoryDto } from './dto/update-category.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import { Category as CategoryModel } from '@prisma/client';

@Injectable()
export class CategoriesService {
  constructor(private prismaService: PrismaService) {}

  async create(createCategoryDto: CreateCategoryDto): Promise<CategoryModel> {
    const category = await this.prismaService.category.create({
      data: {
        name: createCategoryDto.name,
        description: createCategoryDto.description,
        image_url: createCategoryDto.image_url,
      },
    });
    return category;
  }

  async findAll(): Promise<CategoryModel[]> {
    const categories = await this.prismaService.category.findMany();
    return categories;
  }

  async findOne(id: number): Promise<CategoryModel | null> {
    const category = await this.prismaService.category.findUnique({
      where: { id },
    });

    if (!category) {
      throw new NotFoundException(`Category #${id} not found`);
    }

    return category;
  }

  async update(
    id: number,
    updateCategoryDto: UpdateCategoryDto,
  ): Promise<CategoryModel> {
    await this.findOne(id);

    const category = await this.prismaService.category.update({
      where: { id },
      data: {
        name: updateCategoryDto.name,
        description: updateCategoryDto.description,
        image_url: updateCategoryDto.image_url,
      },
    });

    return category;
  }

  async remove(id: number): Promise<void> {
    await this.findOne(id);

    await this.prismaService.category.delete({
      where: { id },
    });
  }
}
