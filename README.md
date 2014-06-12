Swift-List
==========

The List class wraps Swift's Array to use it as a reference type.

What for?
---------

The behavior of Swift's Array is sometimes confusing. The code below is an example.

```swift
var a = [11, 22, 33]

var b = a
a[0] = 777 // b[0] also becomes 777

a.append(44)
a[0] = 888 // b[0] does not become 888
```

It is because Swift's Array is a structure and so a value type. The List class wraps it and we can use it as a reference type.

Usage
-----

You can use the List class like the Array.

```swift
var list = List(2, 3, 5, 7, 11, 13)

list.append(17)
list += 19

for element in list {
    println(element)
}
```

What's the difference?
----------------------

Because the List class is a reference type, it does not cause the confusing behavior above.

```swift
var a = List(11, 22, 33)

var b = a
a[0] = 777

a.append(44)
a[0] = 888 // b[0] also becomes 888
```

License
-------

MIT License. See the LICENSE file.