# BDD で Stack を作る講習

## No.0 空の class を作る

### コマンド

```
$ mkdir {lib, spec}
$ touch lib/stack.rb spec/spec_helper.rb spec/stack_spec.rb
```
### ファイル

```
# lib/stack.rb
class Stack
end
```

```
# spec/spec_helper.rb
require 'stack'
```

```
# spec/stack_spec.rb
require 'spec_helper'

RSpec.describe Stack do
end
```

### 実行する

```
 $ rspec spec/stack_spec.rb
No examples found.


Finished in 0.00042 seconds (files took 0.29251 seconds to load)
0 examples, 0 failures
```

## No.1 Stack の仕様を考える

1. push 出来る?
2. pop 出来る?
3. length を取得出来る?
4. empty? かどうかを尋ねられる？
