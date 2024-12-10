using Godot;
using System;

public partial class Projectile : Area2D
{
    private Vector2 direction;
    private const float Speed = 200.0f;
    private const float TileSize = 64.0f; // Dodana stała TileSize

    // Typ pocisku: 0 - papier, 1 - kamień, 2 - nożyce
    private int type;

    public void Initialize(Vector2 startPosition, Vector2 dir, int projectileType)
    {
        Position = startPosition;
        direction = dir.Normalized();
        type = projectileType;

        // Zmieniamy wygląd pocisku w zależności od typu
        switch (type)
        {
            case 0:
                Modulate = Colors.Blue; // Papier
                break;
            case 1:
                Modulate = Colors.Gray; // Kamień
                break;
            case 2:
                Modulate = Colors.Red; // Nożyce
                break;
        }
    }

    public override void _Ready()
    {
        Connect("area_entered", Callable.From<Area2D>(OnAreaEntered));
    }

    public override void _Process(double delta)
    {
        Position += direction * Speed * (float)delta;

        // Usuwanie pocisków po opuszczeniu grida
        if (Position.Y < 0 || Position.Y > 5 * TileSize)
        {
            QueueFree();
        }
    }

    private void OnAreaEntered(Area2D area)
    {
        if (area is Projectile otherProjectile)
        {
            ResolveProjectileCollision(otherProjectile);
        }
    }

    private void ResolveProjectileCollision(Projectile other)
    {
        // Logika papier-kamień-nożyce
        if ((type == 0 && other.type == 2) || // Papier > Nożyce
            (type == 1 && other.type == 0) || // Kamień > Papier
            (type == 2 && other.type == 1))   // Nożyce > Kamień
        {
            other.QueueFree();
        }
        else if ((type == 2 && other.type == 0) || // Nożyce < Papier
                 (type == 0 && other.type == 1) || // Papier < Kamień
                 (type == 1 && other.type == 2))   // Kamień < Nożyce
        {
            QueueFree();
        }
    }
}