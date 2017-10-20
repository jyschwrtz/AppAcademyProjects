class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # ...
      names.each do |name|
        getter_name = name.to_sym
        setter_name = (name.to_s + "=").to_sym
        define_method(getter_name) { instance_variable_get("@#{name}") }
        define_method(setter_name) { |value| instance_variable_set("@#{name}", value) }
      end
  end
end
