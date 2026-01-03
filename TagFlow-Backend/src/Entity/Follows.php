<?php



use Doctrine\ORM\Mapping as ORM;

/**
 * Follows
 *
 * @ORM\Table(name="follows", uniqueConstraints={@ORM\UniqueConstraint(name="ux_follow", columns={"follower_id", "followed_id"})}, indexes={@ORM\Index(name="followed_id", columns={"followed_id"}), @ORM\Index(name="IDX_4B638A73AC24F853", columns={"follower_id"})})
 * @ORM\Entity
 */
class Follows
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="created_at", type="datetime", nullable=true, options={"default"="CURRENT_TIMESTAMP"})
     */
    private $createdAt = 'CURRENT_TIMESTAMP';

    /**
     * @var \Users
     *
     * @ORM\ManyToOne(targetEntity="Users")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="followed_id", referencedColumnName="id")
     * })
     */
    private $followed;

    /**
     * @var \Users
     *
     * @ORM\ManyToOne(targetEntity="Users")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="follower_id", referencedColumnName="id")
     * })
     */
    private $follower;


}
