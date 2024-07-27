#include <stdio.h>
#include "chromiumbase64.h"

// Declare external LLVM function
extern size_t chromium_base64_decode(char* dest, const char* src, size_t len);

int main() {
    char src[] = "your_base64_encoded_data";
    char dest[256];
    size_t result = chromium_base64_decode(dest, src, sizeof(src));
    if (result == (size_t)-1) {
        printf("Error in decoding\n");
    } else {
        printf("Decoded data length: %zu\n", result);
        // Process decoded data
    }
    return 0;
}
