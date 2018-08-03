# BDD で Stack を作る講習

## No.0 空の class を作る

### コマンド

```sh
$ mkdir {lib, spec}
$ touch lib/stack.rb spec/spec_helper.rb spec/stack_spec.rb
```
### ファイル

```ruby
# lib/stack.rb
class Stack
end
```

```ruby
# spec/spec_helper.rb
require 'stack'
```

```ruby
# spec/stack_spec.rb
require 'spec_helper'

RSpec.describe Stack do
end
```

### 実行する

```ruby
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

## No.2 spec を書いて実行する

```ruby
# spec/stack_spec.rb
require 'spec_helper'

RSpec.describe Stack do
  let(:stack) { Stack.new }

  describe "#push" do
    subject { stack.push 1 }
    it { expect(subject).to eq stack }
  end
end
```

### 実行する

```sh
$ rspec spec/stack_spec.rb
F

Failures:

  1) Stack#push
     Failure/Error: subject { stack.push 1 }

     NoMethodError:
       undefined method `push' for #<Stack:0x00007f8f3a8c5ea8>
     # ./spec/stack_spec.rb:7:in `block (3 levels) in <top (required)>'
     # ./spec/stack_spec.rb:8:in `block (3 levels) in <top (required)>'

Finished in 0.00303 seconds (files took 0.22636 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/stack_spec.rb:8 # Stack#push
```

## No.3 Error を Failure にする

```ruby
# lib/stack.rb
class Stack
  def push(value)
  end
end
```

### 実行する

```sh
 $ rspec spec/stack_spec.rb
F

Failures:

  1) Stack#push should eq #<Stack:0x00007fd42f158578>
     Failure/Error: it { expect(subject).to eq stack }

       expected: #<Stack:0x00007fd42f158578>
            got: nil

       (compared using ==)
     # ./spec/stack_spec.rb:8:in `block (3 levels) in <top (required)>'

Finished in 0.02387 seconds (files took 0.25895 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/stack_spec.rb:8 # Stack#push should eq #<Stack:0x00007fd42f158578>
```

## No.4 実装する

```ruby
class Stack
  def push(value)
    self
  end
end
```

### 実行する

```sh
 $ rspec spec/stack_spec.rb
.

Finished in 0.00217 seconds (files took 0.10744 seconds to load)
1 example, 0 failures
```
