{
  # source:  https://nixos.org/manual/nixos/stable/#sec-configuration-file
  networking.extraHosts = ''
    # anime (illegal)
    0.0.0.0 animevietsub.dev
    0.0.0.0 animesubvn.tv

    # livestream
    0.0.0.0 kick.com
    0.0.0.0 www.twitch.tv

    # esports
    0.0.0.0 www.vlr.gg
    0.0.0.0 liquipedia.net

    # manga (illegal)
    0.0.0.0 blogtruyenmoi.com
    0.0.0.0 blogtruyen.vn
    0.0.0.0 mangadex.org
    0.0.0.0 mangakakalot.to
    0.0.0.0 truyenqqviet.com
    0.0.0.0 ww8.mangakakalot.tv
    0.0.0.0 nettruyenviet.com
    0.0.0.0 nettruyencc.com
    0.0.0.0 nettruyenco.vn
    0.0.0.0 nettruyenfull.com
    0.0.0.0 www.nettruyendie.com
    0.0.0.0 www.nettruyenmck.com

    # football (illegal)
    0.0.0.0 rakhoi.rakhoiz.space
    0.0.0.0 cakhia.cakhia10.xyz
  '';
}
