Puppet::Type.newtype(:httpauth) do
    @doc = "Manage HTTP Basic or Digest password files." +
           "    httpauth { 'user':                     " +
           "      file => '/path/to/password/file',    " +
           "      password => 'password',              " +
           "      mechanism => basic,                  " +
           "      ensure => present,                   " +
           "    }                                      "
 
    ensurable

    newparam(:name) do
       desc "The name of the user to be managed."

       isnamevar
    end 

    newparam(:file) do
       desc "The HTTP password file to be managed. If it doesn't exist it is created."
    end

    newparam(:password) do
       desc "The password in plaintext."
    end

    newparam(:realm) do
       desc "The realm - defaults to nil and mainly used for Digest authentication."

       defaultto "nil"
   end
    
   newparam(:mechanism) do
       desc "The authentication mechanism to use - either basic or digest. Default to basic."
       
       newvalues(:basic, :digest)
      
       defaultto :basic
    end
end