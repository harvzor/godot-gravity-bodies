# Godot Gravity Bodies Plugin

A plugin/addon for Godot which adds support for fairly realistic point gravity physics (currently only in 2D).

## Why?

Godots built-in "gravity point" physics can be hard to build around. Some issues I have found are:

- only Area2D can have the physics behaviour attached to it
    - to set this up you have to have a large collision shape on the Area2D for gravity to be detected
- there's a bug which means that gravity isn't realistically calculated https://github.com/godotengine/godot/issues/30575
    - this means you can't setup stable orbits

This plugin offers an alternative way of creating point physics.

## Requirements

- Godot 3.x

## Getting started

### How to install

1. Download the latest release from the releases page
2. Unpack the zip into your project into `./addons/gravity_bodies/`
3. Check the plugin has been imported successfully in Godot
    1. go to Project -> Project Settings... -> Plugins -> find Gravity Bodies (and Enable)

### Setup

1. Create a new scene in your project with a root node (such as Node2D)
2. Add a gravity body to the root
    1. Add a child node to your root
        1. Either add a GravityBody2D node
        2. Or add a RigidBody2D node and attach the script from `res://addons/gravity_bodies/GravityBody2D.gd`
    2. Give your new node a collision shape
    3. Give your new node something visual like a sprite
    4. Repeat step 2 (but make sure nodes aren't overlapping
3. Run the project

Each gravity body should be attracted to each other.

### Configuration

You can configure how the gravity is setup with the following properties on a GravityBody2D node:

#### Gravity

This property changes how much this node pulls on other gravity bodies.

I recommend setting the `mass` property rather than `gravity` property.

#### Gravity Distance Scale

Changing this property will produce unpredictable/unrealistic physics so use with caution!

Example: setting this property to 0.5 will reduce the gravity given to another particle by half.

#### Mass

Similar to changing how much this node pulls on other gravity bodies.

#### Gravity Scale

Multiplies the gravity applied to this body.

## Examples

These examples can be tested by running them from the `./examples` folder.

### SolSystem

<video src='/.github/example-videos/solsystem.mp4' width=180/>
