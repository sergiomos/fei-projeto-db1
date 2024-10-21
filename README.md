erDiagram
    singers {
        int singer_id PK
        string name
        date birthday
    }

    discs {
        int disc_id PK
        string title
        date launch_date
        int singer_id FK
    }

    musics {
        int music_id PK
        string title
        int duration
        int disc_id FK
    }

    singer_music {
        int singer_id PK, FK
        int music_id PK, FK
    }

    user {
        int user_id PK
        string nome
        string email UNIQUE
        date data_registro
    }

    playlist {
        int playlist_id PK
        string title
        int user_id FK
    }

    playlist_music {
        int playlist_id PK, FK
        int music_id PK, FK
    }

    singer ||--o{ disc : "possui"
    disc ||--o{ music : "contém"
    music ||--o{ singer_music : "é interpretada por"
    singer ||--o{ singer_music : "interpreta"
    user ||--o{ playlist : "cria"
    playlist ||--o{ playlist_music : "contém"
    music ||--o{ playlist_music : "aparece em"
