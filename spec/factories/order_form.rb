 FactoryBot.define do
   factory :order_form do
     zipcode        { "123-4567" }
     prefecture_id  {2}
     city           { "札幌市" }
     street         {"1-1-1"}
     phone          {"09012345678"}
     building       {"abc"}
     token {"tok_XXXXXXXXXXXX"}
   end
 end
