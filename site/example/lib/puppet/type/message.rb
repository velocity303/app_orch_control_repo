Puppet::Type.newtype :message, :is_capability => true do
 newparam :name, :is_namevar => true
 newparam :origin
 newparam :message
end
