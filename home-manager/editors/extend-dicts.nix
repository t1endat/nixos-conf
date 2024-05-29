{ libre-dictionaries,... }:
{
  # library for spelling
  home.file."Library/Spelling" = {
    source = "${libre-dictionaries}/vi";
    recursive = true;
  };
}
