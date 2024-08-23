#include <common.h>
#include <drivers/fs/sfs.h>
#include <lib/alloc.h>

// "dev" build entry for x86_64
EFI_STATUS _violet_x86_64_dev_entry(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable) {
    __violet_init(ImageHandle, SystemTable);
    printf("Hello, World x86_64!\r\n");
    for(;;);
}

// "release" build entry for x86_64
EFI_STATUS _violet_x86_64_release_entry(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable) {
    // Call the dev entry for now.
    _violet_x86_64_dev_entry(ImageHandle, SystemTable);
    for(;;);
}