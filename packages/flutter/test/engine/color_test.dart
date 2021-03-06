// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:test/test.dart';

void main() {
  test('color accessors should work', () {
    final Color foo = const Color(0x12345678);
    expect(foo.alpha, equals(0x12));
    expect(foo.red, equals(0x34));
    expect(foo.green, equals(0x56));
    expect(foo.blue, equals(0x78));
  });

  test('paint set to black', () {
    final Color c = const Color(0x00000000);
    final Paint p = new Paint();
    p.color = c;
    expect(c.toString(), equals('Color(0x00000000)'));
  });

  test('color created with out of bounds value', () {
    try {
      final Color c = const Color(0x100 << 24);
      final Paint p = new Paint();
      p.color = c;
    } catch (e) {
      expect(e != null, equals(true));
    }
  });

  test('color created with wildly out of bounds value', () {
    try {
      final Color c = const Color(1 << 1000000);
      final Paint p = new Paint();
      p.color = c;
    } catch (e) {
      expect(e != null, equals(true));
    }
  });
}
