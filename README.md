# Unikraft Go "hello world" Application

This application prints "hello world" using go.

To configure, build and run this application you need to have [kraft](https://github.com/unikraft/kraft) installed.

Configure the application:
```
kraft configure
```

Build the application:
```
kraft build
```

And finally, run the application:
```
kraft run -M 512
```

If you want to have more control, you can configure and run the application manually.

To configure it with the desired features:
```
make menuconfig
```

Build the application:
```
make
```

Run the application:
```
sudo qemu-system-x86_64 \
	     -kernel build/helloworld-go_kvm-x86_64 \
	     -enable-kvm \
	     -m 1G \
	     -nographic

```

For more information about `kraft` type ```kraft -h``` or read the
[documentation](http://docs.unikraft.org).
