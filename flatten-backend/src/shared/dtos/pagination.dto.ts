export interface PaginationDto<T> {
  readonly data: T[];
  readonly count: number;
  readonly limit: number;
  readonly page: number;
}
