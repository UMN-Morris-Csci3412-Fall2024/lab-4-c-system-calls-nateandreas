#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

// Function to check if a character is a vowel
int is_vowel(char c) {
    c = tolower(c);
    return c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u';
}

// Function to disemvowel content
void disemvowel(FILE *input, FILE *output) {
    char c;
    while ((c = fgetc(input)) != EOF) {
        if (!is_vowel(c)) {
            fputc(c, output);
        }
    }
}

int main(int argc, char *argv[]) {
    FILE *input = stdin;
    FILE *output = stdout;

    // Handle input file
    if (argc > 1) {
        input = fopen(argv[1], "r");
        if (!input) {
            fprintf(stderr, "Error: Could not open input file %s\n", argv[1]);
            return 1;
        }
    }

    // Handle output file
    if (argc > 2) {
        output = fopen(argv[2], "w");
        if (!output) {
            fprintf(stderr, "Error: Could not open output file %s\n", argv[2]);
            if (input != stdin) fclose(input);
            return 1;
        }
    }

    // Perform disemvoweling
    disemvowel(input, output);

    // Clean up
    if (input != stdin) fclose(input);
    if (output != stdout) fclose(output);

    return 0;
}
