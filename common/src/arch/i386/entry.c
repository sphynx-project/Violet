#include <common.h>

// "dev" build entry for i386
EFI_STATUS _violet_i386_dev_entry(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable) {
    __violet_init(ImageHandle, SystemTable);
    SystemTable->ConOut->OutputString(SystemTable->ConOut, L"Hello, World i386!\r\n");
    for(;;);
}

// "release" build entry for i386
EFI_STATUS _violet_i386_release_entry(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable) {
    // Call the dev entry for now.
    _violet_i386_dev_entry(ImageHandle, SystemTable);
    for(;;);
}