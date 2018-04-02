require_relative('../models/cat')
require_relative('../models/owner')
require ("pry-byebug")

Owner.delete_all()
Cat.delete_all()

owner1 = Owner.new({
  'name' => 'Rebecca',
  'age' => 36,
  'background' => 'I would like a ginger and white male cat who is floppy and fluffy',
  'accommodation_type' => 'house with garden, no main roads nearby',
  'total_existing_cats' => 1
  })
owner2 = Owner.new({
  'name' => 'Kenny',
  'age' => 46,
  'background' => 'I would like a crazy tawny coloured female cat',
  'accommodation_type' => 'flat, no access to garden',
  'total_existing_cats' => 0
  })
# binding.pry
  owner1.save()
  owner2.save()

cat1 = Cat.new({
  'name' => 'Arokh',
  'age' => 7,
  'gender' => 'Male',
  'color' => 'White and ginger',
  'description' => 'Floppy, so fluffy, smiles constantly. Has not learned to meow yet',
  'admission_date' => '11/12/17',
  'status' => 'Adopted',
  'owner_id' => owner1.id
  })
cat2 = Cat.new({
  'name' => 'Scamp',
  'age' => 6,
  'gender' => 'Female',
  'color' => 'Tawny',
  'description' => 'Slightly physcho, will stare at you constantly, maybe gives some love if food is given',
  'admission_date' => '08/01/18',
  'status' => 'Adopted',
  'owner_id' => owner2.id
  })

  cat1.save()
  cat2.save()
