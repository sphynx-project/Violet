#include <lib/alloc.h>
#include <common.h>

#define EFI_POOL EfiLoaderData

// Allocate memory using the selected EFI memory type
void *malloc(size_t size)
{
    void *ptr;
    EFI_STATUS status;
    status = systemTable->BootServices->AllocatePool(EFI_POOL, size, &ptr);
    if (EFI_ERROR(status))
    {
        printf("[ERROR] Failed to allocate memory (Status: 0x%x)\r\n", status);
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
    // Copy memory from src to dest
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
