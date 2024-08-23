#include <lib/alloc.h>

// Allocate memory using EfiLoaderData
void *malloc(size_t size)
{
    void *ptr;
    if (EFI_ERROR(systemTable->BootServices->AllocatePool(EfiLoaderData, size, &ptr)))
    {
        return NULL;
    }

    return ptr;
}

void free(void *ptr)
{
    systemTable->BootServices->FreePool(ptr);
}

// Copy memory from src to dest
void CopyMem(void *dest, const void *src, size_t size)
{
    char *d = dest;
    const char *s = src;
    while (size--)
    {
        *d++ = *s++;
    }
}

void *realloc(void *ptr, size_t new_size)
{
    if (!ptr)
        return malloc(new_size);

    void *new_ptr = malloc(new_size);
    if (!new_ptr)
        return NULL;

    CopyMem(new_ptr, ptr, new_size);
    free(ptr);
    return new_ptr;
}