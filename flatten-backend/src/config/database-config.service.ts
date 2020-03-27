import { ConfigService } from '@nestjs/config';
import { Injectable } from '@nestjs/common';
import { TypeOrmOptionsFactory, TypeOrmModuleOptions } from '@nestjs/typeorm';

@Injectable()
export class DatabaseConfigService implements TypeOrmOptionsFactory {
	constructor(private readonly configService: ConfigService) {}

	createTypeOrmOptions(): TypeOrmModuleOptions {
		return {
			type: 'mysql',
			host: this.configService.get<string>('TYPEORM_HOST'),
			port: this.configService.get<number>('TYPEORM_PORT'),
			username: this.configService.get<string>('TYPEORM_USERNAME'),
			password: this.configService.get<string>('TYPEORM_PASSWORD'),
			database: this.configService.get<string>('TYPEORM_DATABASE'),
			entities: [ __dirname + '/**/*.entity{.ts,.js}' ],
			migrations: [ __dirname + '/migration/**/*{.ts,.js}' ],
			migrationsTableName: 'migration',
			cli: {
				entitiesDir: 'src/entity',
				migrationsDir: 'src/migration'
			},
			synchronize: true,
			autoLoadEntities: true,
		};
	}
}
