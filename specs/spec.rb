require 'minitest/autorun'
require_relative '../models/cat'
require_relative '../models/owner'

class TestCat < Minitest::Test

  def setup
    @cat = Cat.new({
      'name' => 'Arokh',
      'age' => 7,
      'gender' => 'Male',
      'color' => 'White and ginger',
      'description' => 'Floppy, so fluffy, smiles constantly. Has not learned to meow yet',
      'admission_date' => '11/12/17',
      'status' => 'Adopted',
      # 'owner_id' => owner1.id
      })
  end

  def test_color
      assert_equal( 'White and ginger', @cat.color )
  end

end
