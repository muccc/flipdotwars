gem "activesupport"
require "active_support/core_ext/array"

def separator(repeat_count)
  "%3d----------------------------------------------------------------\n" % repeat_count
end

frames = []

repeat_count = [2, 15,  6,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1, 10, 30,  9, 40,  9,  8,  8,  8,  8,  8,  8,  8,  8,
		 8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
		 8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
		 8,  8,  8,  8,  8,  8,  8,  8,  8,  8, 11,  8,  2,  1,  1,  2,  2,  2,  2,  2,
		 2,  2,  2,  2,  2,  2,  2,  2,  3,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 3,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1, 17,  2,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  7,  1, 15,  5,  5,  1, 15,  5,  5, 15,  2,  3,  2,  2,  2,  2,  2,  2,  2,
		 1,  2,  2,  2,  2, 14,  3, 15,  2,  2,  2,  2,  2,  2,  2,  2,  2,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  4,  1,  2,  2,  2,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  2,  2,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 2,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  3,  6, 10,  6, 18,  4, 30,  2, 30,  5,  3, 11, 11, 11, 11,  6,
		 6,  9,  9,  8,  6, 11, 11,  8, 11,  7,  6, 16,  7,  1, 10, 13,  4,  6,  5, 20,
		 4,  7,  4,  9,  4,  6,  6,  3,  5,  3,  6,  6,  3,  5, 21,  3, 12,  6,  8,  6,
		 4,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  2,  1,  7, 18,
		 3,  8,  9,  5,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  3,  5, 12,  7,  5,
		 4,  6, 10,  7,  7,  2,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1, 10, 10,  3, 13,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  2,  2,  2,  2,  5, 24,  2,
		25,  2, 24,  5,  9,  1,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
		 2,  1,  1,  1,  1,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  1,
		 1,  2,  2,  2,  2,  2,  2,  2,  2,  2,  9, 30,  2,  2,  2,  2,  2,  2,  2,  2,
		 2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
		 2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
		 2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
		 2,  2,  2,  2, 11,  5, 19,  6,  5,  5,  5,  1,  2,  5,  5,  1,  3,  6,  3,  5,
		 6, 13, 10, 13, 16, 10,  6,  7,  6, 14, 20, 16,  6, 13, 12,  5,  8,  6, 10,  6,
		 6,  7, 12, 11,  6, 10, 10, 15,  4,  4, 10, 10,  4,  3,  5,  3,  2,  1,  2,  2,
		 2,  2,  1,  1,  2,  2,  2,  3,  4,  5,  3,  3,  6, 15, 16,  6, 10, 10, 11,  7,
		 8, 28,  7,  6, 11,  4,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
		 5,  5,  5, 14, 13,  9, 11,  6,  5, 11,  3,  8, 17, 11,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1, 11,  4,
		 5, 37,  5,  6, 34,  6,  2,  6,  6,  4,  2,  3,  3,  2,  4,  1,  5,  5,  1,  3,
		 3,  2,  4,  1,  5,  5,  1,  4,  2,  3,  3,  2,  4,  1,  5,  5,  1,  4,  2,  6,
		 6,  6,  6,  5,  1,  6,  3,  3,  6,  1,  5,  6,  6,  4,  2,  6,  2,  4,  6,  5,
		 1,  5,  1,  6,  4,  2,  4,  2,  2,  4,  6,  6,  4,  2,  5,  1,  2,  4,  4,  2,
		 6,  2,  4,  6,  1,  5,  6,  6, 20,  3,  2, 31,  6,  2,  9,  6,  4, 30, 30, 30,
		 5, 29,  5, 14,  5, 13,  3,  6, 30,  1,  9,  6,  2,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  3,  4,  6, 14, 12,  3, 12, 12,  4,  8,  5,  5, 19,
		 7,  2, 20,  1,  6, 21, 18, 12, 11,  7,  2,  7,  4, 11, 17,  9,  5,  2,  2,  2,
		 2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2, 22,  3, 15, 12,  5,  1,  4, 31,  6,
		15, 16,  5,  4, 14, 15,  6, 14, 15,  5,  5,  1, 14,  5,  1, 14,  6, 11,  8,  9,
		 5, 10, 18, 28,  5,  3, 11, 10, 17,  8,  9, 21,  6,  5,  1, 14, 13,  3,  2,  8,
		 3,  5, 29, 16, 16, 16,  6, 16, 15,  5, 29,  4,  1,  6,  3, 41,  4, 31,  3, 30,
		 5,  9,  5, 14, 10,  5,  2,  1,  1,  1,  1,  1,  1,  3,  4, 30,  6, 30, 30,  5,
		20,  9,  6,  5,  4, 10,  6,  4,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  4,  4,  8, 13, 10,  8, 20,  5,  9, 11,  6,  8,  5, 15, 11,  7,
		 6,  9,  2,  2,  2,  1,  1,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
		 2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
		 2,  2,  2,  2,  2,  2,  1,  2,  2,  2,  4,  7, 10, 15,  6,  5,  7,  5,  5, 10,
		16, 17,  1,  6, 21, 10, 10,  6, 20, 12, 14,  6,  3, 10, 15, 14, 20, 16, 11,  6,
		 6, 15, 21, 20,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  2,  2,  8,  6,  3,
		 3,  3,  3,  3,  3,  7,  2,  6,  4,  4,  4,  6,  8,  1,  4,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  4,  3, 10,  3,  2, 21,  8,  1,
		 4,  3,  7,  1,  5,  7,  5, 21, 15, 25, 10, 10, 16,  4, 20,  3,  6,  6, 32,  5,
		20,  1, 32,  7, 20,  6, 16,  7, 31,  1, 22,  2, 20,  3, 21, 21,  2,  7,  6,  6,
		 6,  6,  2,  6,  1,  7,  7,  3,  6, 20,  9, 16,  1,  2, 13,  5, 16, 12,  6, 15,
		11,  6, 19,  7,  4, 21,  2,  6,  4, 13,  9,  3,  5,  5, 10, 12,  6, 19, 26,  6,
		 5,  6,  3, 10,  4,  3, 14,  6,  1,  5, 25,  4,  4,  3,  9,  1,  5,  3,  4,  3,
		 2,  4,  5, 14, 12,  4,  5,  4,  6,  4,  1,  1,  1,  1,  7,  5,  6, 10,  3,  3,
		 1,  1, 14,  6,  5,  2,  1,  1,  1,  1,  5, 20,  2, 49,  1, 49,  1, 45,  1, 49,
		 1, 36,  1, 49,  1, 51,  1, 49,  1, 49,  6,  4,  5,  9, 21,  2,  2,  9, 11, 30,
		 4,  4, 69,  1, 59,  1, 55,  1, 36,  5,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  3,  3,  3, 28,  1, 40,  4,  9,  6,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
		 2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
		 2,  2, 12,  3,  6, 39,  1, 31,  3, 29,  1,  4, 13, 10, 11,  3,  9, 21,  6, 10,
		 6,  1,  4,  3,  2,  8,  5, 11,  1, 23,  2,  3, 16,  7, 10,  1,  4, 10,  1,  3,
		 4, 11,  6, 13,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  7,  3, 29,
		 1, 29,  1, 28,  1, 30, 15,  2,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1, 16,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  8,  2,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  3,  7,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  5,  4,  5,
		16,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  1,  1,  1, 17,  3,  6, 15,
		 1,  2,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  3,  2,  1,
		 2,  1,  2,  1,  2,  1,  3,  3,  3,  3,  3,  3,  3,  3,  3,  1,  2,  3,  3,  3,
		 3,  3,  3,  3,  3,  3,  2,  1,  2,  1,  3,  3,  3,  3,  3,  3,  3,  3,  3,  1,
		 2,  3,  3,  3,  3,  3,  3,  3,  3,  3,  1,  2,  3,  2,  6,  5, 25,  1, 36,  1,
		26,  4,  3,  2,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  7,  1,  1,  1,  1,  1,  1,  1,  1,  1, 12,  1,  1,  1,  2,  2,  2,
		 2,  7, 25,  1, 26,  1, 25,  1, 25,  1, 25,  1, 26,  1, 25,  1,  1,  2,  2,  2,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  5,  7,  1, 29,  2,  8, 17, 19,  7,  4, 29,
		 8,  1,  8, 20,  3,  1, 32,  6,  1, 31, 34,  4,  4,  6,  1,  1,  1,  7,  1,  2,
		 6,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  4,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  2,  1,  3,  1,  2,
		 1,  3,  5,  6,  1,  5,  8,  6,  2,  3,  2,  1, 14, 11,  4,  6,  5,  1,  3, 19,
		 7, 20,  2,  2,  4,  3, 16,  1,  1,  1,  7,  1,  7, 24,  2, 30,  5, 33, 31,  5,
		 5,  6,  6,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  7,  9,
		 6, 10, 23, 11, 10,  6,  3,  6, 35,  2, 35,  1, 32,  1,  1, 12,  4, 13,  2,  3,
		 2, 27,  1, 30,  1,  6,  2, 29,  1, 10,  1,  1,  1,  4,  3,  3,  2, 31, 30,  1,
		30,  1, 31,  1, 31,  1, 32,  1, 30,  1, 26,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  6,  7,  2,  2,  2,  2,  2,  2,  2,  1,  1,  2,  2,  2,  2,  2,  2,
		 2,  2,  2,  2,  2,  2,  2,  2,  1,  1,  1,  1,  2,  1,  1,  2,  2,  1,  1,  2,
		 2,  2,  2,  2,  2,  2,  2,  2,  1, 10,  6,  3,  3,  3,  3,  3,  3,  3,  3,  3,
		 3,  3,  3,  3,  3,  3,  3,  2,  1,  3,  3,  1,  3,  6, 20, 12,  6,  5,  7,  2,
		 1,  1,  2,  1,  1,  2,  1,  1,  2,  1,  1,  2,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  3,  3,  3, 10,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  6,  3,  6,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
		 2,  1,  1,  7,  1,  6,  3,  3,  3,  4, 20,  6,  2,  5, 23, 12,  1, 22,  8, 11,
		30,  1,  4, 28,  4,  4,  7, 22,  2, 28,  1,  1,  3,  3, 33,  1, 31,  3,  3,  2,
		 2,  3,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  2,  1,
		 1,  1,  1,  1,  1,  1,  5,  1,  1,  1,  1,  1,  4,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  9,  7,  1,  1,  3,  1,  1,  2,  1,  1,  3,  1,  1,  3,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  2,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  2,  1,  1,  1,  3,  1,  1,
		 1,  4,  7, 15,  1,  1,  1,  4, 11,  1,  1,  5,  5,  7,  6,  2,  5, 15, 31,  3,
		 1,  7, 14, 10,  2,  3,  1,  1,  6, 14,  1,  1,  1,  1,  1,  2,  2,  1,  1,  1,
		 1,  1,  1,  6,  1,  6,  1,  1,  1,  1,  1,  1,  1,  6,  2,  2,  6,  7, 13,  3,
		 1,  8,  3, 16,  3,  3,  3,  5,  9,  1,  1,  1,  1,  1,  1,  1, 10,  2,  1,  1,
		 7,  5,  2,  7,  4,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1, 13, 18,  4,  5,
		 4, 17,  1,  1,  1,  1,  2,  1,  1,  1,  3,  1,  1,  1,  3,  1,  1,  1,  3,  1,
		 1,  1,  3,  1,  1,  1,  3,  3,  3,  2,  5,  5,  5,  6,  3, 39,  1,  5, 10, 16,
		 7,  7,  4, 25,  5,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1, 10,  3,  4, 11, 19,  6,  4,  2, 23,  1, 24,  7,  1,  3,
		 3,  3,  3, 15,  2, 14,  1,  6, 22,  4, 11, 12,  4, 10, 12,  1,  9, 11,  6,  2,
		 2,  2, 16,  4, 24, 20,  6,  3,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
		 2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  6,  4,
		 4, 25,  5, 36,  3, 40,  2,  3, 33,  3,  6, 14,  2,  4,  3,  2,  2,  2,  2,  2,
		 2,  2,  2,  2,  2,  2,  2,  1,  1,  2,  2,  2, 17,  2, 25,  4, 26,  4, 20,  1,
		 2, 34,  1,  2, 19,  1, 30,  4,  1, 13,  1,  1,  1,  1,  1,  1,  1,  1,  4,  4,
		 2,  4, 34, 29,  1, 30,  2, 31,  1,  1,  1,  1,  5, 25,  3, 35,  6, 21,  3, 30,
		 6,  3,  4, 25,  6, 36,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
		 2, 18, 15, 17,  3, 20,  1,  1,  1,  1,  1,  5, 10,  7,  4, 31,  3,  3, 13, 17,
		 4,  4,  2,  3,  6, 16,  7,  6, 32,  5,  4,  8,  2,  2,  2,  2,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  2,  2,  3,  1,  1,  1,  1,  2,  1,  2,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  3,  2,  4,  3,
		 1,  8,  9,  7,  7,  1, 14, 12,  4,  1,  2,  3,  2,  1,  3,  3,  3,  3,  3,  3,
		 3,  3,  1,  2,  2,  2,  3,  1,  2,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1, 13,  6,  2,  3,  3,  1,  2,  1,  1,  1,  2,  1,  3,  1,  2,  1,
		 1,  1,  2,  1,  3,  1,  3,  1,  6,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
		 2,  2,  2,  2,  3,  1,  6, 19,  1,  8, 15,  6, 25,  4, 30,  1, 20,  1, 29,  2,
		21,  1, 20,  6,  3, 17,  4, 38,  2,  3,  3,  6,  3,  5,  5, 19, 13,  5,  1,  2,
		 3,  1,  1,  2,  2,  3,  1,  1,  2,  2,  2,  3,  2,  2,  2,  3,  1,  1,  2,  2,
		 2,  3,  4,  4, 18,  1,  6,  4, 11, 18,  3, 10,  5,  8,  6,  1,  6, 22,  2, 19,
		 4,  1,  6, 16,  4,  2,  2,  1,  3,  2, 11, 13,  4,  2,  9,  6,  6, 11, 10,  5,
		 2,  5,  6,  6,  7,  3,  7,  2,  6,  7,  9,  6,  7,  5,  2,  6,  9,  9,  2,  5,
		 3,  5, 29,  2,  2, 16, 17,  1,  5,  2,  4,  2,  8,  2, 17,  6,  2, 19,  5, 11,
		11,  4,  2,  4,  2, 14,  3,  3,  5,  2,  2, 14,  6,  1,  5, 11,  6,  2,  1,  2,
		 3,  1,  5,  6, 10,  7, 16,  2, 19,  9,  6,  6,  5,  6, 19,  9,  6,  1,  5, 20,
		 7,  2,  2, 16,  3, 10,  5,  2,  5, 15,  3,  8, 11,  7,  3,  4,  2,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 2, 14,  4,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  4,
		 5,  9, 11,  6,  3, 14,  9,  6,  7,  6,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  2,  7,  2,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  2,  1,  4,  4,  4, 11,  6,  7,  3,  3, 13,  1,  3,  1,  2,
		 2,  2,  1,  1,  2,  2,  3, 30,  3, 32,  3, 12,  4,  2,  2,  2,  2,  2,  2,  2,
		 2,  2,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  3,  1,  1,  2,  5,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  2,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  2,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  3,  2,  2,
		 2,  2,  2,  2,  2,  2,  1,  1,  2,  2,  2,  2,  2,  2,  2,  2,  2,  4,  1,  1,
		 2,  2,  2,  2,  1,  1,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  1,  1,  1,  1,
		 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  3, 19,
		 8,  1,  2,  1,  1,  5, 11, 18,  5,  2,  4,  1,  1,  1,  1,  1,  1,  1,  1,  1,
		 1,  1,  1,  1,  7, 11, 15,  3,  4, 17, 15,  2,  1, 24,  2, 16,  5,  3,  3,  4,
		23,  3,  9,  4,  2,  4,  8,  6,  3,  4,  4,  1,  2,  1,  1,  2,  2,  5,  3,  1,
		 4,  2,  2,  1,  7,  1,  7,  3,  1,  1,  5,  1,  1,  1,  3,  1,  2,  1,  1,  1,
		 1,  3,  6,  8,  1,  1,  4,  4,  4,  4,  4,  2,  3,  3,  3,  1,  2,  2,  2, 10,
		 7,  1,  1,  5,  4,  2,  1,  1,  1,  8,  1,  1,  1,  5,  9,  1,  3,  2,  1,  1,
		 2,  2,  2,  2,  4,  2,  5,  8,  1,  1,  2,  8, 11,  1,  1,  1,  3,  1,  3,  1,
		 2,  1,  1,  2,  2,  5,  3,  1,  4,  2,  2,  1,  7,  1,  7,  3,  1,  1,  5,  1,
		 1,  1,  3,  1,  2,  1,  1,  1,  1,  3,  6,  8,  1,  1,  4,  4,  4,  4,  4,  2,
		 3,  3,  3,  1,  2,  2,  2, 10,  7,  1,  1,  5,  4,  2,  1,  1,  1,  8,  1,  1,
		 1,  5,  9,  1,  3,  2,  1,  1,  2,  2,  2,  2,  4,  2,  5,  8,  1,  1,  2,  8,
		11,  1,  1,  1,  3,  1,  3,  1, 48,  1,                                    255]
    
    
File.read("framedata.txt").lines.in_groups_of(13).each_with_index do |framelines, i|
  frames << separator(repeat_count[i]) + framelines.join.sub(/^\t\t`/, "").sub(/`,$/, "")
end

File.write("data/movie.txt", frames.join)



# chars = {}
# frames.each do |frame|
#   frame.split("").each do |char|
#     chars[char] ||= 0
#     chars[char] += 1
#   end
# end
# require "pp"
# pp chars.sort
