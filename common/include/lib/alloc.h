#ifndef ALLOC_H
#define ALLOC_H

#include <common.h>
#include <stddef.h>

void *malloc(size_t size);
void free(void *ptr);
void *realloc(void *ptr, size_t new_size);

#endif // ALLOC_H