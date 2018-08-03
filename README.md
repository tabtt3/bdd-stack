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
# lib/stack.rb
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

## No.5 前提条件のある spec で Fake it

```ruby
# spec/stack_spec.rb
...
  context "1 を push 済みの stack" do
    before { stack.push 1 }
    describe "length が 1" do
      subject { stack.length }
      it { expect(subject).to eq 1 }
    end
  end
...
```

### 実行する

```
$ rspec spec/stack_spec.rb
.F

Failures:

  1) Stack 1 を push 済みの stack length が 1
     Failure/Error: subject { stack.length }

     NoMethodError:
       undefined method `length' for #<Stack:0x00007fc82d8fe308>
     # ./spec/stack_spec.rb:14:in `block (4 levels) in <top (required)>'
     # ./spec/stack_spec.rb:15:in `block (4 levels) in <top (required)>'

Finished in 0.00295 seconds (files took 0.10604 seconds to load)
2 examples, 1 failure

Failed examples:

rspec ./spec/stack_spec.rb:15 # Stack 1 を push 済みの stack length が 1
```

### Error を Failure にする

```ruby
# lib/stack.rb
...
  def length
  end
...
```

### 実行する

```sh
 $ rspec spec/stack_spec.rb
.F

Failures:

  1) Stack 1 を push 済みの stack length が 1 should eq 1
     Failure/Error: it { expect(subject).to eq 1 }

       expected: 1
            got: nil

       (compared using ==)
     # ./spec/stack_spec.rb:15:in `block (4 levels) in <top (required)>'

Finished in 0.01297 seconds (files took 0.10957 seconds to load)
2 examples, 1 failure

Failed examples:

rspec ./spec/stack_spec.rb:15 # Stack 1 を push 済みの stack length が 1 should eq 1
```

### Fake it(仮実装)

```ruby
# lib/stack.rb
  def length
    1
  end
```

### 実行する

```sh
 $ rspec spec/stack_spec.rb
..

Finished in 0.00296 seconds (files took 0.108 seconds to load)
2 examples, 0 failures
```

## No.6 前提条件を増やして実実装

```
# spec/stack_spec.rb
...
  context "1 と 5 を push 済みの stack" do
    before do
      stack.push 1
      stack.push 5
    end
    subject { stack.length }
    describe "length が 2" do
      it { expect(subject).to eq 2 }
    end
  end
...
```

### 実行する

```sh
 $ rspec spec/stack_spec.rb
..F

Failures:

  1) Stack 1 と 5 を push 済みの stack length が 2 should eq 2
     Failure/Error: it { expect(subject).to eq 2 }

       expected: 2
            got: 1

       (compared using ==)
     # ./spec/stack_spec.rb:26:in `block (4 levels) in <top (required)>'

Finished in 0.01281 seconds (files took 0.10742 seconds to load)
3 examples, 1 failure

Failed examples:

rspec ./spec/stack_spec.rb:26 # Stack 1 と 5 を push 済みの stack length が 2 should eq 2
```

#### Failure を Error にして実実装を行なう

```ruby
# lib/stack.rb
class Stack
  def initialize
    @buffer = []
  end

  def push(value)
    @buffer.push(value)
    self
  end

  def length
    @buffer.length
  end
end
```

### 実行する

```sh
 $ rspec spec/stack_spec.rb
...

Finished in 0.00312 seconds (files took 0.10855 seconds to load)
3 examples, 0 failures
```
