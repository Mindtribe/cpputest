workspace :CppUTest, File.dirname(__FILE__) do |w|
  w.add_default_tasks(['CppUTest:Test'])
  w.add_default_tasks(['CppUTestExt:Test'])
end

static_library_project :CppUTest, File.dirname(__FILE__) do |lib|

  lib.add_api_headers 'include'

  lib.add_configuration :Test,
    sources: ['src/CppUTest/*.cpp', 'src/Platforms/Gcc/*.cpp'],
    toolchain: toolchain(:gcc,
      cppflags: '-DNDEBUG',
      cflags: '-include CppUTest/MemoryLeakDetectorMallocMacros.h -g -Wall -Wextra -Wshadow -Wswitch-default -Wswitch-enum -Wconversion -Wsign-conversion -Wno-padded -Wno-disabled-macro-expansion -Wstrict-prototypes',
      cxxflags: '-include CppUTest/MemoryLeakDetectorNewMacros.h -include CppUTest/MemoryLeakDetectorMallocMacros.h -g -Wall -Wno-old-style-cast -Wextra -Wshadow -Wswitch-default -Wswitch-enum -Wconversion -Wsign-conversion -Wno-padded -Wno-disabled-macro-expansion -Woverloaded-virtual -Wno-global-constructors -Wno-exit-time-destructors -Wno-weak-vtables -O2 -g'
    ),
    tests: [
      'CppUTestTests:Test'
    ]

  lib.build_framework_package([:Test])
end

static_library_project :CppUTestExt, File.dirname(__FILE__) do |lib|

  lib.add_api_headers 'include'

  lib.add_configuration :Test,
    sources: ['src/CppUTestExt/*.cpp'],
    toolchain: toolchain(:gcc,
      cppflags: '-DNDEBUG',
      cflags: '-include CppUTest/MemoryLeakDetectorMallocMacros.h -g -Wall -Wextra -Wshadow -Wswitch-default -Wswitch-enum -Wconversion -Wsign-conversion -Wno-padded -Wno-disabled-macro-expansion -Wstrict-prototypes',
      cxxflags: '-include CppUTest/MemoryLeakDetectorNewMacros.h -include CppUTest/MemoryLeakDetectorMallocMacros.h -g -Wall -Wno-old-style-cast -Wextra -Wshadow -Wswitch-default -Wswitch-enum -Wconversion -Wsign-conversion -Wno-padded -Wno-disabled-macro-expansion -Woverloaded-virtual -Wno-global-constructors -Wno-exit-time-destructors -Wno-weak-vtables -O2 -g'
    ),
    tests: [
      'CppUTestExtTests:Test'
    ]
end

test_application_project :CppUTestTests, File.dirname(__FILE__) do |app|

  app.add_configuration :Test,
    sources: [
      'tests/AllocationInCFile.c',
      'tests/AllocationInCppFile.cpp',
      'tests/AllocLetTestFree.c',
      'tests/AllocLetTestFreeTest.cpp',
      'tests/AllTests.cpp',
      'tests/CheatSheetTest.cpp',
      'tests/CommandLineArgumentsTest.cpp',
      'tests/CommandLineTestRunnerTest.cpp',
      'tests/JUnitOutputTest.cpp',
      'tests/MemoryLeakDetectorTest.cpp',
      'tests/MemoryOperatorOverloadTest.cpp',
      'tests/MemoryLeakWarningTest.cpp',
      'tests/PluginTest.cpp',
      'tests/PreprocessorTest.cpp',
      'tests/SetPluginTest.cpp',
      'tests/SimpleStringTest.cpp',
      'tests/SimpleMutexTest.cpp',
      'tests/TestFailureNaNTest.cpp',
      'tests/TestFailureTest.cpp',
      'tests/TestFilterTest.cpp',
      'tests/TestHarness_cTest.cpp',
      'tests/TestHarness_cTestCFile.c',
      'tests/TestInstallerTest.cpp',
      'tests/TestMemoryAllocatorTest.cpp',
      'tests/TestOutputTest.cpp',
      'tests/TestRegistryTest.cpp',
      'tests/TestResultTest.cpp',
      'tests/TestUTestMacro.cpp',
      'tests/UtestTest.cpp',
      'tests/UtestPlatformTest.cpp'
      ],
    toolchain: toolchain(:gcc,
      cppflags: '-DNDEBUG',
      cflags: '-include CppUTest/MemoryLeakDetectorMallocMacros.h -Wall -Wextra -Wshadow -Wswitch-default -Wswitch-enum -Wconversion -Wsign-conversion -Wno-padded -Wno-disabled-macro-expansion -Wstrict-prototypes',
      cxxflags: '-include CppUTest/MemoryLeakDetectorNewMacros.h -include CppUTest/MemoryLeakDetectorMallocMacros.h -Wall -Wno-old-style-cast -Wextra -Wshadow -Wswitch-default -Wswitch-enum -Wconversion -Wsign-conversion -Wno-padded -Wno-disabled-macro-expansion -Woverloaded-virtual -Wno-global-constructors -Wno-exit-time-destructors -Wno-weak-vtables -O2 -g',
      ldflags: '-lstdc++'
    ),
    dependencies: [
      'CppUTest:Test'
    ]
end

test_application_project :CppUTestExtTests, File.dirname(__FILE__) do |app|

  app.add_configuration :Test,
    sources: [
      'tests/CppUTestExt/AllTests.cpp',
      'tests/CppUTestExt/CodeMemoryReporterTest.cpp',
      'tests/CppUTestExt/GMockTest.cpp',
      'tests/CppUTestExt/GTest1Test.cpp',
      'tests/CppUTestExt/GTest2ConvertorTest.cpp',
      'tests/CppUTestExt/MemoryReportAllocatorTest.cpp',
      'tests/CppUTestExt/MemoryReporterPluginTest.cpp',
      'tests/CppUTestExt/MemoryReportFormatterTest.cpp',
      'tests/CppUTestExt/MockActualCallTest.cpp',
      'tests/CppUTestExt/MockCheatSheetTest.cpp',
      'tests/CppUTestExt/MockCallTest.cpp',
      'tests/CppUTestExt/MockComparatorCopierTest.cpp',
      'tests/CppUTestExt/MockExpectedCallTest.cpp',
      'tests/CppUTestExt/ExpectedFunctionsListTest.cpp',
      'tests/CppUTestExt/MockFailureTest.cpp',
      'tests/CppUTestExt/MockHierarchyTest.cpp',
      'tests/CppUTestExt/MockNamedValueTest.cpp',
      'tests/CppUTestExt/MockParameterTest.cpp',
      'tests/CppUTestExt/MockPluginTest.cpp',
      'tests/CppUTestExt/MockSupportTest.cpp',
      'tests/CppUTestExt/MockSupport_cTest.cpp',
      'tests/CppUTestExt/MockSupport_cTestCFile.c',
      'tests/CppUTestExt/MockStrictOrderTest.cpp',
      'tests/CppUTestExt/MockReturnValueTest.cpp',
      'tests/CppUTestExt/OrderedTestTest.cpp'
      ],
    toolchain: toolchain(:gcc,
      cppflags: '-DNDEBUG',
      cflags: '-include CppUTest/MemoryLeakDetectorMallocMacros.h -Wall -Wextra -Wshadow -Wswitch-default -Wswitch-enum -Wconversion -Wsign-conversion -Wno-padded -Wno-disabled-macro-expansion -Wstrict-prototypes',
      cxxflags: '-include CppUTest/MemoryLeakDetectorNewMacros.h -include CppUTest/MemoryLeakDetectorMallocMacros.h -Wall -Wno-old-style-cast -Wextra -Wshadow -Wswitch-default -Wswitch-enum -Wconversion -Wsign-conversion -Wno-padded -Wno-disabled-macro-expansion -Woverloaded-virtual -Wno-global-constructors -Wno-exit-time-destructors -Wno-weak-vtables -O2 -g',
      ldflags: '-lstdc++',
      include_paths: [
        'include/CppUTestExt/CppUTestGMock',
        'include/CppUTestExt/CppUTestGTest'
      ]
    ),
    dependencies: [
      'CppUTest:Test', 'CppUTestExt:Test'
    ]
end
