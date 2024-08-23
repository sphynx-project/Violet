#ifndef COMMON_H
#define COMMON_H

#define _X64
#include <efi/efi.h>

// Temporary fix.
typedef EFI_INTN INTN;
#include <efi/efilib.h>

extern EFI_HANDLE *imageHandle;
extern EFI_SYSTEM_TABLE *systemTable;

extern EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL *stdout;
extern EFI_SIMPLE_TEXT_INPUT_PROTOCOL *stdin;
extern EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL *stderr;

void __violet_init(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable);

#endif // COMMON_H