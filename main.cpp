#include <iostream>
#include <iostream>
#include <dlfcn.h>

//thread_local std::string bro;

int loop() {
	void* handle = dlopen("./libdylib_hello.so", RTLD_LAZY);
	if (!handle) {
		std::cerr << "Error opening library: " << dlerror() << std::endl;
		return 1;
	}

	dlerror();

	typedef void (*rust_hello_world_t)();
	rust_hello_world_t rust_hello_world = (rust_hello_world_t) dlsym(handle, "hello_from_rust");

	const char* error = dlerror();
	if (error) {
		std::cerr << "Error finding symbol: " << error << std::endl;
		dlclose(handle);
		return 1;
	}

	rust_hello_world();

	dlclose(handle);
	return 0;
}

int main(int argc, char* argv[]) {
	int count = 0;
	int loop_count_max = 0;
	while(1) {
		++count;
		printf("dude loop %d\n", count);
		if (!(argc < 2))
			loop_count_max = std::stoi(argv[1]);

		if (count == loop_count_max)
			break;

		loop();
	}

	//bro = "dude";
	return 0;
}
