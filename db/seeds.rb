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
owner3 = Owner.new({
  'name' => 'Rachael',
  'age' => 31,
  'background' => 'I would like a loyal, intelligent independant cat',
  'accommodation_type' => 'house, garden, on a busy road',
  'total_existing_cats' => 0
  })
owner4 = Owner.new({
  'name' => 'Maggie',
  'age' => 40,
  'background' => 'I am the owner of the pet shelter. When the pets have no owner, they temporarily belong to me',
  'accommodation_type' => 'Maggie/s Moggies Cat Shelter',
  'total_existing_cats' => 10
  })


  owner1.save()
  owner2.save()
  owner3.save()
  owner4.save()

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
  'description' => 'Slightly psycho, constantly plotting your demise, stares constantly; will love you fiercely all other times',
  'admission_date' => '08/01/18',
  'status' => 'Adopted',
  'owner_id' => owner2.id
  })
cat3 = Cat.new({
  'name' => 'Stavros',
  'age' => 5,
  'gender' => 'Male',
  'color' => 'black and grey',
  'description' => 'The biggest playful softie with award winning fluffy eyebrows. Secretly loves hugs. Best kept inside, may run away.',
  'admission_date' => '08/02/18',
  'status' => 'Adoptable',
  'owner_id' => owner4.id
  })
cat4 = Cat.new({
  'name' => 'Tuff McFluff',
  'age' => 12,
  'gender' => 'Male',
  'color' => 'Grey',
  'description' => 'Retired show kitty, loves to laze around in the sunshine all day',
  'admission_date' => '08/03/18',
  'status' => 'Adoptable',
  'owner_id' => owner4.id
  })

  cat1.save()
  cat2.save()
  cat3.save()
  cat4.save()
