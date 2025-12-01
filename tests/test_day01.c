#include <criterion/criterion.h>

long long solve_part1(const char* input);

Test(day01, part1_example) {
    const char* example_input = "1abc2\npqr3stu8vwx\na1b2c3d4e5f\ntreb7uchet";
    long long expected = 142;
    long long actual = solve_part1(example_input);
    cr_assert_eq(actual, expected, "Part 1 example failed!");
}

Test(day01, part1_edge_cases) {
    cr_assert_eq(solve_part1(""), 0, "Empty string should be 0");
    cr_assert_eq(solve_part1("no_digits_here"), 0, "String with no digits should be 0");
    cr_assert_eq(solve_part1("7"), 77, "Single digit should be doubled");
}
