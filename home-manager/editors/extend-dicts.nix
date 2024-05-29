{ libre-dictionaries,... }:

{
  # library for Vietnamese
  # TODO: should move to multiple source instead
  home.file."Library/Spelling/vi_VN.aff" = {
    source = "${libre-dictionaries}/vi_VN.aff";
  };
  
  home.file."Library/Spelling/vi_VN.dic" = {
    source = "${libre-dictionaries}/vi_VN.dic";
  };
}
