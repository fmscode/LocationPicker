Pod::Spec.new do |s|
  s.name             = "LocationPicker"
  s.version          = "0.1.0"
  s.summary          = "Drop in UIPickerView that allows for US State and country selection."
  s.description      = <<-DESC
                        Drop in UIPickerView that allows a user to select from a location, US states and countries.
                       DESC
  s.homepage         = "http://github.com/fmscode"
  s.license          = 'MIT'
  s.author           = { "Frank Michael Sanchez" => "orion1701@me.com" }
  s.source           = { :git => "https://github.com/fmscode/LocationPicker.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes'
  s.resources = 'Assets/*.plist'

end
