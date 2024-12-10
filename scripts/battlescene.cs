using Godot;
using System;

public partial class BattleScene : Node
{
    private const int GridSizeX = 5;
    private const float TileSize = 2.0f;

    // Referencje do gracza i przeciwnika
    [Export] private NodePath playerPath;
    [Export] private NodePath enemyPath;

    private CharacterBody2D player;
    private CharacterBody2D enemy;

    // Typy pocisków
    private int selectedProjectileType = 0; // Domyślnie papier (0)
    private Random random = new Random();

    [Export] private PackedScene projectileScene;

    public override void _Ready()
    {
        player = GetNode<CharacterBody2D>(playerPath);
        enemy = GetNode<CharacterBody2D>(enemyPath);

        // Timer strzelania co 1 sekundę
        GetNode<Timer>("Timer").Connect("timeout", this, nameof(ShootProjectile));
    }

    public override void _Process(float delta)
    {
        HandlePlayerMovement();
        HandleProjectileSelection();
    }

    private void HandlePlayerMovement()
    {
        Vector2 movement = Vector2.Zero;

        if (Input.IsActionPressed("ui_left"))
        {
            movement.x -= TileSize;
        }
        if (Input.IsActionPressed("ui_right"))
        {
            movement.x += TileSize;
        }

        Vector2 newPos = player.Position + movement;
        newPos.x = Mathf.Clamp(newPos.x, 0, (GridSizeX - 1) * TileSize);
        player.Position = newPos;
    }

    private void HandleProjectileSelection()
    {
        if (Input.IsActionJustPressed("select_paper")) // Papier
        {
            selectedProjectileType = 0;
            GD.Print("Wybrano: Papier");
        }
        else if (Input.IsActionJustPressed("select_rock")) // Kamień
        {
            selectedProjectileType = 1;
            GD.Print("Wybrano: Kamień");
        }
        else if (Input.IsActionJustPressed("select_scissors")) // Nożyce
        {
            selectedProjectileType = 2;
            GD.Print("Wybrano: Nożyce");
        }
    }

    private void ShootProjectile()
    {
        // Gracz strzela wybranym pociskiem
        SpawnProjectile(player, Vector2.Up, selectedProjectileType);

        // Przeciwnik strzela losowym pociskiem
        int enemyProjectileType = random.Next(0, 3); // Losowy typ (0, 1 lub 2)
        SpawnProjectile(enemy, Vector2.Down, enemyProjectileType);
    }

    private void SpawnProjectile(Node2D shooter, Vector2 direction, int projectileType)
    {
        var projectile = (Projectile)projectileScene.Instantiate();
        AddChild(projectile);

        projectile.Initialize(shooter.Position, direction, projectileType);
    }
}


