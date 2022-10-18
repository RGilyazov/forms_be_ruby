class DeleteNestedActiveRecord < ApplicationRecord
     self.abstract_class = true
     def assign_attributes(new_attributes)
       if new_attributes[:pk] 
            new_attributes[:id] = new_attributes[:pk] if new_attributes[:pk] !=0
            new_attributes.delete(:pk)
        end
        presentValues = {}
        self.nested_attributes_options.each do |association,options|
             if options[:allow_destroy]==true
                  presentValues[association]={}
                  nested_attributes =new_attributes[association.to_s+'_attributes']
                  if nested_attributes 
                          nested_attributes.each do |value|
                             
                              value[:id] = value[:pk] if value[:pk] && value[:pk] !=0
                              presentValues[association][value[:pk]]=true if value[:pk] 
                          end
         
                  end
                  self.send(association).each do |value|
                     value.mark_for_destruction if !presentValues[association][value.id]
                  end
             end
        end

        super(new_attributes)
    end
end
