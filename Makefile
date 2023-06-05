NUM_JOBS=2
BUILD_DIR=build/
BUILD_TYPE=Debug

# These Flags are passed to Cmake When Generating Build Files
CMAKE_GEN_FLAGS=

# These Flags are passed to Cmake When Building The Project
CMAKE_BUILD_FLAGS=

all:
	@cmake -L -S ./ -B $(BUILD_DIR) -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) $(CMAKE_GEN_FLAGS)
	@cmake --build $(BUILD_DIR) --config=$(BUILD_TYPE) --parallel $(NUM_JOBS) $(CMAKE_BUILD_FLAGS)

clean:
	@$(RM) -r $(BUILD_DIR)

run: all
	@./build/myasm
