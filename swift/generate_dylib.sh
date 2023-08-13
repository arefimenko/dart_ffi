swiftc -c swift.swift \
  -module-name swift_module \
  -emit-objc-header-path swift.h \
  -emit-library -o swift.dylib