erDiagram
    Artista {
        int id PK
        string nome
        date data_nascimento
    }

    Disco {
        int id PK
        string titulo
        date data_lancamento
        int artista_id FK
    }

    Musica {
        int id PK
        string titulo
        int duracao
        int disco_id FK
    }

    Artista_Musica {
        int artista_id PK, FK
        int musica_id PK, FK
    }

    Usuario {
        int id PK
        string nome
        string email UNIQUE
        date data_registro
    }

    Playlist {
        int id PK
        string titulo
        int usuario_id FK
    }

    Playlist_Musica {
        int playlist_id PK, FK
        int musica_id PK, FK
    }

    Artista ||--o{ Disco : "possui"
    Disco ||--o{ Musica : "contém"
    Musica ||--o{ Artista_Musica : "é interpretada por"
    Artista ||--o{ Artista_Musica : "interpreta"
    Usuario ||--o{ Playlist : "cria"
    Playlist ||--o{ Playlist_Musica : "contém"
    Musica ||--o{ Playlist_Musica : "aparece em"
