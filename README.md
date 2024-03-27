[![Pub Version](https://img.shields.io/pub/v/radio_button)](https://pub.dev/packages/radio_button)

# RadioButton
RadioButton simple used.

<br />

### Example 

```dart
enum RadioSampleGroupId {
  radio1,
  radio2,
  radio3,
  radio4,
  radio5,
}
```

<br/>
<br/>

#### Vertical
![image](https://github.com/donguran/RadioButton/assets/119420119/72021515-8b81-453e-a4b8-3a77802d34d1)

```dart
RadioGroup(
  groupId: groupId,
  orientation: RadioOrientation.vertical,
  children: [
    RadioButton(value: RadioSampleGroupId.radio1, content: const Text("radio1")),
    RadioButton(value: RadioSampleGroupId.radio2, content: const Text("radio2")),
    RadioButton(value: RadioSampleGroupId.radio3, content: const Text("radio3"),
    ),
  ],
),
```

<br/>
<br/>


#### Horizontal
![image](https://github.com/donguran/RadioButton/assets/119420119/391a2a3b-250e-481a-afc2-14fda3cd0950)

```dart
  RadioGroup(
    onChanged: (value) {
      debugPrint(value.toString());
    },
    groupId: groupId,
    children: [
      RadioButton(value: RadioSampleGroupId.radio1, content: const Text("1"),),
      RadioButton(value: RadioSampleGroupId.radio2, content: const Text("2"),),
      RadioButton(value: RadioSampleGroupId.radio3, content: const Text("3"),),
      RadioButton(value: RadioSampleGroupId.radio4, content: const Text("4"),),
      RadioButton(value: RadioSampleGroupId.radio5, content: const Text("5"),),
    ],
  )
```


<br/>
<br/>


#### MultiLine
<p>I will change this to make more useful parent Widgets</p>

![muliline_radio_button_sample](https://github.com/donguran/RadioButton/assets/119420119/3ce86b0e-8025-46d9-948e-9eda55b35e86)

```dart
  Column(
    children: [
      Row(
        children: [
          RadioButton(groupId: groupIdStr, value: "radio1", content: const Text("Radio1"),
            onChanged: (value) => setState(() {
              groupIdStr = value;
            }),
          ),
          RadioButton(groupId: groupIdStr, value: "radio2", content: const Text("Radio2"),
            onChanged: (value) => setState(() {
              groupIdStr = value;
            }),
          ),
        ],
      ),
      Row(
        children: [
          RadioButton(groupId: groupIdStr, value: "radio3", content: const Text("Radio3"),
            onChanged: (value) => setState(() {
              groupIdStr = value;
            }),
          ),
          RadioButton(groupId: groupIdStr, value: "radio4", content: const Text("Radio4"),
            onChanged: (value) => setState(() {
              groupIdStr = value;
            }),
          ),
          RadioButton(groupId: groupIdStr, value: "radio5", content: const Text("Radio5"),
            onChanged: (value) => setState(() {
              groupIdStr = value;
            }),
          ),
        ]
      )
    ],
  )
```


<br/>
<br/>

### LICENCE
```text
MIT License

Copyright (c) 2024 neander of donguran

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```